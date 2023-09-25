from hkpilot.utils.cmake import CMake


class hkLibToolPackTemplate(CMake):

    def __init__(self, path):
        super().__init__(path)
        self._package_name = "hk-LibToolPackTemplate"
