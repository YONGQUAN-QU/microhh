/*
 * MicroHH
 * Copyright (c) 2011-2020 Chiel van Heerwaarden
 * Copyright (c) 2011-2020 Thijs Heus
 * Copyright (c) 2014-2020 Bart van Stratum
 * Copyright (c) 2018-2019 Elynn Wu
 *
 * This file is part of MicroHH
 *
 * MicroHH is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * MicroHH is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License
 * along with MicroHH.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "radiation_smoke.h"
#include "constants.h"
#include <algorithm>
#include <cmath>

 namespace
 {
     template<typename TF>
     void calc_radiation_tendency(
             TF* thlt, const TF* smoke,
             const TF* rho, const TF* dz,
             const TF f0, const TF ka,
             const int istart, const int iend, const int jstart, const int jend, const int kstart, const int kend, 
             const int icells, const int jcells, const int ijcells, const int ncells)
     {
         // vertical integration
         TF smoke_int[ijcells];
         std::fill(smoke_int, smoke_int+ijcells, TF(0));
         
         for (int i=istart; i<iend; ++i)
             for (int j=jstart; j<jend; ++j)
                 {
                     const int ij = i + j*icells;
                     for (int k=kstart; k<kend; ++k)
                     {
                         const int ijk = i + j*icells + k*ijcells;
                         smoke_int[ij] += std::max(0, smoke[ijk] * rho[k] * dz[k]);
                     }
                 }
         // radiative flux and assiciated tendency
         
         TF rad_flux[ncells];
         std::fill(rad_flux, rad_flux+ncells, TF(0));
         
         for (int i=istart; i<iend; ++i)
             for (int j=jstart; j<jend; ++j)
             {
                 const int ij = i + j*icells;
                 for (int k=kstart+1; k<kend; ++k)
                 {
                     const int ijk = i + j*icells + k*ijcells;
                     const int ijkm1 = i + j*icells + (k-1)*ijcells;
                     smoke_int[ij] -= std::max(0, smoke[ijk] * rho[k] * dz[k]);
                     rad_flux[ijk] = f0 * std::exp(-1. * ka * smoke_int[ij]);
                     thlt[ijk] -= (rad_flux[ijk] - rad_flux[ijkm1])/(rho[k] * Constants::cp<float> * dz[k]);
                 }
             }
     }
 }



template<typename TF>
Radiation_smoke<TF>::Radiation_smoke(Master& masterin, Grid<TF>& gridin, Fields<TF>& fieldsin, Input& inputin) :
    Radiation<TF>(masterin, gridin, fieldsin, inputin)
{
    swradiation = "smoke";

    f0 = inputin.get_item<TF>("radiation", "f0", "");
    ka = inputin.get_item<TF>("radiation", "ka", "");

    auto& gd = grid.get_grid_data();
    fields.init_prognostic_field("smoke", "Smoke concentration", "-", "default", gd.sloc);
}

template<typename TF>
Radiation_smoke<TF>::~Radiation_smoke()
{
}

template<typename TF>
unsigned long Radiation_smoke<TF>::get_time_limit(unsigned long itime)
{
    return Constants::ulhuge;
}

template<typename TF>
bool Radiation_smoke<TF>::check_field_exists(const std::string& name)
{
    return false;  // always returns error
}

template<typename TF>
void Radiation_smoke<TF>::exec(
        Thermo<TF>& thermo, const double time, Timeloop<TF>& timeloop, Stats<TF>& stats)
{
    auto& gd = grid.get_grid_data();

    calc_radiation_tendency(
            fields.st.at("th")->fld.data(), fields.sp.at("smoke")->fld.data(),
            fields.rhoref.data(), gd.dz.data(),
            f0, ka,
            gd.istart, gd.iend, gd.jstart, gd.jend, gd.kstart, gd.kend, 
            gd.icells, gd. jcells, gd.ijcells, gd.ncells);
}

#ifdef FLOAT_SINGLE
template class Radiation_smoke<float>;
#else
template class Radiation_smoke<double>;
#endif
