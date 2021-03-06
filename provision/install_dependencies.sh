#!/bin/csh

# copy source code 
#cp -r /vagrant/downloads/* source/
#cd source

#cd /home/vagrant/wrf/build/source
source ~/.cshrc
cd $SOURCEDIR

#csh
echo 'setenv DIR $BUILDDIR/libraries' >> ~/.cshrc
source ~/.cshrc

# --------------------------------------------------------------
# install mpich
echo "===================================================="
echo "installing mpich"
echo "===================================================="
#tar xzvf mpich-3.1.3.tar.gz
cd mpich-3.1.3
./configure --prefix=$DIR
make 
make install
cd ..

echo 'setenv PATH $DIR/bin:$PATH'  >> ~/.cshrc
source ~/.cshrc
## todo: add for bash shell also 


# --------------------------------------------------------------
# install zlib
echo "===================================================="
echo "installing zlib"
echo "===================================================="
#tar xzvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=$DIR
make 
make install
make check
cd ..

# --------------------------------------------------------------
# install hdf5
echo "===================================================="
echo "installing hdf5"
echo "===================================================="
#tar -xvf hdf5-1.8.14.tar
cd hdf5-1.8.14
./configure --prefix=$DIR --enable-fortran --enable-cxx --with-zlib=$DIR
make # this spits out a LOT of warnings but still seems to work
make install
make check
cd ..

# --------------------------------------------------------------
# install netcdf c
echo "===================================================="
echo "installing netcdf c"
echo "===================================================="
#tar xzvf netcdf-4.3.2.tar.gz
#cd netcdf-4.3.2
cd netcdf-4.3.3
echo 'setenv CPPFLAGS -I$DIR/include' >> ~/.cshrc
echo 'setenv LDFLAGS -L$DIR/lib' >> ~/.cshrc
echo 'setenv LD_LIBRARY_PATH $DIR/lib' >> ~/.cshrc
source ~/.cshrc
./configure --prefix=$DIR --enable-netcdf4
make 
make check
make install
cd ..

# --------------------------------------------------------------
# install netcdf fortran/c++ interfaces
echo "===================================================="
echo "installing netcdf fortran and c++ interfaces"
echo "===================================================="
#tar xzvf netcdf-fortran-4.4.1.tar.gz
cd netcdf-fortran-4.4.1
./configure --prefix=$DIR
make
make check
make install
cd ..

#tar xzvf netcdf-cxx4-4.2.1.tar.gz
cd netcdf-cxx4-4.2.1
./configure --prefix=$DIR
make
make check
make install
cd ..

# --------------------------------------------------------------
# install Jasper
echo "===================================================="
echo "installing jasper"
echo "===================================================="
#tar xzvf jasper-1.900.1.tar.gz     #or just .tar if no .gz present
cd jasper-1.900.1
./configure --prefix=$DIR
make
make check # doesn't seemt to do much
make install
cd .. 

# --------------------------------------------------------------
# install libpng
echo "===================================================="
echo "installing libpng"
echo "===================================================="
#tar xzvf libpng-1.6.14.tar.gz
#cd libpng-1.6.14
cd libpng-1.6.16
./configure --prefix=$DIR
make
make check
make install
cd .. 


