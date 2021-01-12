# Use, modification, and distribution are
# subject to the Boost Software License, Version 1.0. (See accompanying
# file LICENSE.txt)
#
# Copyright Rene Rivera 2020.

# For Drone CI we use the Starlark scripting language to reduce duplication.
# As the yaml syntax for Drone CI is rather limited.
#
#
globalenv={}
linuxglobalimage="cppalliance/droneubuntu1604:1"
windowsglobalimage="cppalliance/dronevs2019"

def main(ctx):
  return [
  linux_cxx("TOOLSET=gcc CXXSTD=03,11 Job 0", "g++", packages="", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,11', 'TRAVIS_COMPILER': 'g++', 'DRONE_JOB_UUID': 'b6589fc6ab'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=98,0x Job 1", "g++", packages="g++-4.4", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '98,0x', 'TRAVIS_COMPILER': 'g++-4.4', 'DRONE_JOB_UUID': '356a192b79'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=03,0x Job 2", "g++", packages="g++-4.6", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,0x', 'TRAVIS_COMPILER': 'g++-4.6', 'DRONE_JOB_UUID': 'da4b9237ba'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=03,11 Job 3", "g++", packages="g++-4.8", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,11', 'TRAVIS_COMPILER': 'g++-4.8', 'DRONE_JOB_UUID': '77de68daec'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=03,11,14,1z Job 4", "g++", packages="g++-5", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,11,14,1z', 'TRAVIS_COMPILER': 'g++-5', 'DRONE_JOB_UUID': '1b64538924'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=03,11,14,1z Job 5", "g++", packages="g++-6", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,11,14,1z', 'TRAVIS_COMPILER': 'g++-6', 'DRONE_JOB_UUID': 'ac3478d69a'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=03,11,14,17 Job 6", "g++", packages="g++-7", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,11,14,17', 'TRAVIS_COMPILER': 'g++-7', 'DRONE_JOB_UUID': 'c1dfd96eea'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=03,11,14,17,2a Job 7", "g++", packages="g++-8", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,11,14,17,2a', 'TRAVIS_COMPILER': 'g++-8', 'DRONE_JOB_UUID': '902ba3cda1'}, globalenv=globalenv),
  linux_cxx("TOOLSET=gcc CXXSTD=03,11,14,17,2a Job 8", "g++", packages="g++-9", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'gcc', 'CXXSTD': '03,11,14,17,2a', 'TRAVIS_COMPILER': 'g++-9', 'DRONE_JOB_UUID': 'fe5dbbcea5'}, globalenv=globalenv),
  linux_cxx("UBSAN=1 TOOLSET=gcc CXXSTD=03,11,14,17,2a UBS Job 9", "g++", packages="g++-9", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'UBSAN': '1', 'TOOLSET': 'gcc', 'CXXSTD': '03,11,14,17,2a', 'UBSAN_OPTIONS': 'print_stacktrace=1', 'LINKFLAGS': '-fuse-ld=gold', 'TRAVIS_COMPILER': 'g++-9', 'DRONE_JOB_UUID': '0ade7c2cf9'}, globalenv=globalenv),
  linux_cxx("TOOLSET=clang CXXSTD=03,11,14,1z Job 10", "clang++", packages="", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'TOOLSET': 'clang', 'CXXSTD': '03,11,14,1z', 'TRAVIS_COMPILER': 'clang++', 'DRONE_JOB_UUID': 'b1d5781111'}, globalenv=globalenv),
  linux_cxx("UBSAN=1 TOOLSET=clang CXXSTD=03,11,14,1z UBSA Job 11", "clang++", packages="", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'UBSAN': '1', 'TOOLSET': 'clang', 'CXXSTD': '03,11,14,1z', 'UBSAN_OPTIONS': 'print_stacktrace=1', 'TRAVIS_COMPILER': 'clang++', 'DRONE_JOB_UUID': '17ba079149'}, globalenv=globalenv),
  linux_cxx("TOOLSET=clang CXXSTD=03,11,14,1z Job 12", "clang++", packages="libc++-dev", buildtype="boost", buildscript="drone", image="cppalliance/droneubuntu1404:1", environment={'TOOLSET': 'clang', 'CXXSTD': '03,11,14,1z', 'TRAVIS_COMPILER': 'clang++-libc++', 'DRONE_JOB_UUID': '7b52009b64'}, globalenv=globalenv),
  linux_cxx("UBSAN=1 TOOLSET=clang CXXSTD=03,11,14,1z UBSA Job 13", "clang++", packages="libc++-dev", buildtype="boost", buildscript="drone", image="cppalliance/droneubuntu1404:1", environment={'UBSAN': '1', 'TOOLSET': 'clang', 'CXXSTD': '03,11,14,1z', 'UBSAN_OPTIONS': 'print_stacktrace=1', 'TRAVIS_COMPILER': 'clang++-libc++', 'DRONE_JOB_UUID': 'bd307a3ec3'}, globalenv=globalenv),
  osx_cxx("TOOLSET=clang CXXSTD=03,11,14,1z Job 14", "clang++", packages="", buildtype="boost", buildscript="drone", environment={'TOOLSET': 'clang', 'CXXSTD': '03,11,14,1z', 'TRAVIS_COMPILER': 'clang++', 'DRONE_JOB_UUID': 'fa35e19212'}, globalenv=globalenv),
  linux_cxx("CMAKE=1 Job 15", "g++", packages="", buildtype="097d99d7d8-33ea46fe89", buildscript="drone", image=linuxglobalimage, environment={'CMAKE': '1', 'DRONE_JOB_UUID': 'f1abd67035'}, globalenv=globalenv),
    ]

# from https://github.com/boostorg/boost-ci
load("@boost_ci//ci/drone/:functions.star", "linux_cxx","windows_cxx","osx_cxx","freebsd_cxx")
