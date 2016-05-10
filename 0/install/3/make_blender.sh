#!/bin/bash

# Default Arguments
version=2.69
blender="$HOME/blender"
numjobs=6
cycles=1 #1 == install cycles by default

# #############################################################################
#
# Blender Maker
# ----------------
#
# This script was created to install only the Cycles files
# without having to worry about all the other install files
# in Blender. I ended up adding the capability of fully make Blender.
#
#
# Folder Structure
# ----------------
# //lib     - libraries (OSX require that, Linux not so much)
# //blender - where .git exists, pointing to git.blender.org
#
# //blender/source/...
# //blender/CMakeLists.txt
#
# //release - folder for subfolder per branch
#
# //release/bugfix1 - folder to build the bugfix1 branch
# //release/master  - folder to build the master branch, and fallback folder when
#                     there is no specific folder for the current branch
#
# This script is intended to run
# 
# It can run from any folder
#
# usage:
# ------
# make_blender.sh --make --numjobs 6 --version 2.69 --blender $HOME/blender
#
###############################################################################


# Argument = -m -j 7 -i -r 2.69 -b $HOME/blender -v

usage()
{
cat << EOF
usage: $0 options

This script make and install Blender

OPTIONS:
   -h      Show this message
   -m      Make Blender (not only install the files)
   -c      Install only Cycles files, default is $cycles
   -n      Not install Cycles files, it overrides -c
   -i      Install all Blender, it overrides -c and -n (run it once at least)
   -j      Number of Jobs, default is $numjobs
   -r      Blender Release, default is $version
   -b      Blender home folder, default is $blender
   -v      Verbose
EOF
}


VERBOSE=0
MAKE=0
NUMJOBS=$numjobs
VERSION=$version
BLENDER=$blender
INSTALL=0
CYCLES=$cycles

while getopts "hmvicnj:r:b:" OPTION
do
  case $OPTION in
     h)
       usage
       exit 1
       ;;
    m)
      MAKE=1
      ;;
    j)
      NUMJOBS=$OPTARG
      ;;
    r)
      VERSION=$OPTARG
      ;;
    b)
      BLENDER=$OPTARG
      ;;
    v)
      VERBOSE=1
      ;;
    c)
      CYCLES=1
      ;;
    n)
      CYCLES=0
      ;;
    i)
      INSTALL=1
      ;;
    ?)
      usage
      exit
      ;;
  esac
done


__git_ps1 ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "%s " "${b##refs/heads/}";
    fi
}

git_release_dir()
{
    local root="$(git rev-parse --show-toplevel)"
    local branch="$(__git_ps1)"
    local prevdir=$(pwd);

    if [ -d $root/../release/$branch ]; then
        echo $root/../release/$branch
    elif [ -d $root/../release/master ]; then
        echo $root/../release/master
    else
        echo "Error: No git master release folder found"
        exit
    fi
}

cycles="${BLENDER}/git/blender/intern/cycles"
release="$(git_release_dir)"

if [ $INSTALL -eq 1 ]; then
  INSTALL_FLAG=install
else
  INSTALL_FLAG=
fi

if [ $MAKE -eq 1 ]; then
  echo "Making Blender"
  cd $(git_release_dir); make -j$NUMJOBS $INSTALL_FLAG

  # if install is on, don't need to install Cycles
  if [ $INSTALL -eq 1 ] || [ $CYCLES -eq 0 ]; then
    exit;
  fi
fi


# Different OSs use different Blender folder structure
myos="$(uname)"
case $myos in
  Darwin)
    target="${release}/bin/blender.app/Contents/MacOS/${VERSION}/scripts/addons/cycles"
    ;;
  Linux)
    target="${release}/bin/${VERSION}/scripts/addons/cycles"
    ;;
  *)
    echo "Operating System ($myos) not supported"
    exit
    ;;
esac

# Files list copied from CMakeLists.txt of cycles files
ADDON_FILES=(
	addon/__init__.py
	addon/engine.py 
	addon/osl.py
	addon/presets.py
	addon/properties.py
	addon/ui.py
)

SRC_HEADERS=(
	kernel.h
	kernel_accumulate.h
	kernel_bvh.h
	kernel_bvh_subsurface.h
	kernel_bvh_traversal.h
	kernel_camera.h
	kernel_compat_cpu.h
	kernel_compat_cuda.h
	kernel_compat_opencl.h
	kernel_curve.h
	kernel_differential.h
	kernel_displace.h
	kernel_emission.h
	kernel_film.h
	kernel_globals.h
	kernel_jitter.h
	kernel_light.h
	kernel_math.h
	kernel_montecarlo.h
	kernel_object.h
	kernel_passes.h
	kernel_path.h
	kernel_path_state.h
	kernel_primitive.h
	kernel_projection.h
	kernel_random.h
	kernel_shader.h
	kernel_subsurface.h
	kernel_textures.h
	kernel_triangle.h
	kernel_types.h
)

SRC_UTIL_HEADERS=(
	util_color.h
	util_math.h
	util_transform.h
	util_types.h
)

SRC_CLOSURE_HEADERS=(
	closure/bsdf.h
	closure/bsdf_ashikhmin_velvet.h
	closure/bsdf_diffuse.h
	closure/bsdf_diffuse_ramp.h
	closure/bsdf_microfacet.h
	closure/bsdf_oren_nayar.h
	closure/bsdf_phong_ramp.h
	closure/bsdf_reflection.h
	closure/bsdf_refraction.h
	closure/bsdf_toon.h
	closure/bsdf_transparent.h
	closure/bsdf_util.h
	closure/bsdf_ward.h
	closure/bsdf_westin.h
	closure/bsdf_hair.h
	closure/bssrdf.h
	closure/emissive.h
	closure/volume.h
)

SRC_SVM_HEADERS=(
	svm/svm.h
	svm/svm_attribute.h
	svm/svm_blackbody.h
	svm/svm_camera.h
	svm/svm_closure.h
	svm/svm_convert.h
	svm/svm_checker.h
	svm/svm_brick.h
	svm/svm_displace.h
	svm/svm_fresnel.h
	svm/svm_wireframe.h
	svm/svm_wavelength.h
	svm/svm_gamma.h
	svm/svm_brightness.h
	svm/svm_geometry.h
	svm/svm_gradient.h
	svm/svm_hsv.h
	svm/svm_image.h
	svm/svm_invert.h
	svm/svm_light_path.h
	svm/svm_magic.h
	svm/svm_mapping.h
	svm/svm_math.h
	svm/svm_mix.h
	svm/svm_musgrave.h
	svm/svm_noise.h
	svm/svm_noisetex.h
	svm/svm_normal.h
	svm/svm_ramp.h
	svm/svm_sepcomb_rgb.h
	svm/svm_sepcomb_hsv.h
	svm/svm_sky.h
	svm/svm_tex_coord.h
	svm/svm_texture.h
	svm/svm_types.h
	svm/svm_value.h
	svm/svm_vector_transform.h
	svm/svm_voronoi.h
	svm/svm_wave.h
)

SRC_UTIL_HEADERS=(
	../util/util_color.h
	../util/util_math.h
	../util/util_transform.h
	../util/util_types.h
)


SRC_KERNEL_OTHERS=(
	kernel.cl
	kernel.cu
)


SRC_OSL_HEADERS=(
	node_texture.h
	node_color.h
	node_fresnel.h
	stdosl.h
	oslutil.h
)

# TODO - dynamically generated list
SRC_OSO=(
)


# COPY OPERATIONS
echo "Start installing  ..."

echo "Installing addon files ..."
# base addon files
rm ${target}* 2>/dev/null
for i in ${ADDON_FILES[@]}; do	
  cp ${cycles}/blender/$i ${target}
done

if [ $VERBOSE -eq 1 ]; then
  echo ""
  for i in ${ADDON_FILES[@]}; do	
    echo "${cycles}/blender/$i -> ${target}/${i##addon/}"
  done
  echo ""
fi

echo "Installing kernel files ..."
# kernel files
rm ${target}/kernel/* 2>/dev/null
rm ${target}/kernel/svm/ 2>/dev/null
for i in ${SRC_HEADERS[@]} ${SRC_CLOSURE_HEADERS[@]} ${SRC_SVM_HEADERS[@]} ${SRC_UTIL_HEADERS[@]} ${SRC_KERNEL_OTHERS[@]}; do
  cp ${cycles}/kernel/$i ${target}/kernel/$(printf "%s" "${i##../util/}")
done

if [ $VERBOSE -eq 1 ]; then
  echo ""
  for i in ${SRC_HEADERS[@]} ${SRC_CLOSURE_HEADERS[@]} ${SRC_SVM_HEADERS[@]} ${SRC_UTIL_HEADERS[@]} ${SRC_KERNEL_OTHERS[@]}; do
    echo "${cycles}/kernel/$i ->" ${target}/kernel/$(printf "%s" "${i##../util/}")
  done
  echo ""
fi

echo "Installing kernel shader files ..."
# kernel shader files
rm ${target}/kernel/shaders/* 2>/dev/null
for i in ${SRC_OSL_HEADERS[@]} ${SRC_OSO[@]}; do
  cp ${cycles}/kernel/shaders/$i ${target}/kernel/shaders
done

if [ $VERBOSE -eq 1 ]; then
  echo ""
  for i in ${SRC_OSL_HEADERS[@]} ${SRC_OSO[@]}; do
    echo "${cycles}/kernel/shaders/$i -> ${target}/kernel/shaders"
  done
  echo ""
fi

