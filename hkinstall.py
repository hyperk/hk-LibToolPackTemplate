from hkpilot.utils.cmake import CMake


class hkLibToolPackTemplate(CMake):

    def __init__(self, path):
        super().__init__(path)
        self._package_name = "hk-LibToolPackTemplate"

    def post_install(self):
        # Run standard post_install step
        super().post_install()

        # Link compiled tool into
        compiled_tools_folder = os.environ.get("HK_COMPILEDTOOLS_DIR")
        logger.info(f"Linking installation to {compiled_tools_folder}")
        if not os.path.exists(compiled_tools_folder):
            logger.debug("Folder doesn't exist: creating it")
            os.mkdir(compiled_tools_folder)
        symlink = os.path.join(compiled_tools_folder, self._package_name)
        # if os.path.exists(symlink):
        os.symlink(self._install_folder, symlink)
        return True

