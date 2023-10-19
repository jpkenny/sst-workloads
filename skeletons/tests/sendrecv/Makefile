TARGET := runsendrecv
SRC := main.cc

SST_MPI=/Users/jpkenny/install/sst-mpi

CXX :=    sst++
CC :=     sstcc
CXXFLAGS := -fPIC
CPPFLAGS := -I.
LIBDIR :=  
PREFIX := 
LDFLAGS :=  -Wl,-rpath,$(PREFIX)/lib -lsst_mpi -L$(SST_MPI)/lib -Wl,-rpath,$(SST_MPI)/lib

OBJ := $(SRC:.cc=.o) 
OBJ := $(OBJ:.cpp=.o)
OBJ := $(OBJ:.c=.o)

.PHONY: clean install 

all: $(TARGET)

$(TARGET): $(OBJ) 
	$(CXX) -o $@ $+ $(LDFLAGS) $(LIBS)  $(CXXFLAGS)

%.o: %.cc 
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean: 
	rm -f $(TARGET) $(OBJ) 

install: $(TARGET)
	cp $< $(PREFIX)/bin

