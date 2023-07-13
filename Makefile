ToolFrameworkPath = ../ButtonDAQ/Dependencies/ToolFrameworkCore
DataModelPath = ../ButtonDAQ/Dependencies/ToolFrameworkCore/

CXXFLAGS = g++ -O3 -fPIC

objects:= $(patsubst %.cpp, %.o, $(filter-out template/%.cpp, $(wildcard */*.cpp)))

all: $(objects)
	$(CXXFLAGS) --shared $(objects) -o libMyToolPack.so -I $(DataModelPath)/include -L $(DataModelPath)/lib -lDataModel -I $(ToolFrameworkPath)/include -L $(ToolFrameworkPath)/lib -lStore -LLogging 

%.o: %.cpp
	$(CXXFLAGS) -c $< -o $@  -I $(DataModelPath)/include -L $(DataModelPath)/lib -lDataModel -I $(ToolFrameworkPath)/include -L $(ToolFrameworkPath)/lib -lStore -LLogging

clean:
	rm ./*/*.o
