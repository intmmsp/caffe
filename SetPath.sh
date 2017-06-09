#!/bin/sh

cd build/tools/
cp caffe caffe.bkp
install_name_tool -change "@rpath/libcudnn.6.dylib" "/Developer/NVIDIA/CUDA-8.0/lib/libcudnn.6.dylib" caffe
install_name_tool -change "@rpath/./libhdf5_hl.10.dylib" "/Users/Rui/anaconda/lib/libhdf5_hl.10.dylib" caffe
install_name_tool -change "@rpath/./libhdf5.10.dylib" "/Users/Rui/anaconda/lib/libhdf5.10.dylib" caffe
cd ../lib/
cp libcaffe.so libcaffe.so.bkp
cp libcaffe.so.1.0.0 libcaffe.so.1.0.0.bkp
install_name_tool -change "@rpath/libcudnn.6.dylib" "/Developer/NVIDIA/CUDA-8.0/lib/libcudnn.6.dylib" libcaffe.so
cd ../test/
cp test_all.testbin test_all.testbin.bkp
install_name_tool -change "@rpath/./libcudnn.6.dylib" "/Developer/NVIDIA/CUDA-8.0/lib/libcudnn.6.dylib" test_all.testbin
install_name_tool -change "@rpath/./libhdf5_hl.10.dylib" "/Users/Rui/anaconda/lib/libhdf5_hl.10.dylib" test_all.testbin
install_name_tool -change "@rpath/./libhdf5.10.dylib" "/Users/Rui/anaconda/lib/libhdf5.10.dylib" test_all.testbin
