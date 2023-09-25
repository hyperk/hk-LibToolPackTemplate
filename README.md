# HK Tool Pack Template

This repository can be used as a template for creating other HK packages.
It contains all the necessary files and information for:
- integration in HK installation framework,
- basic dependencies with ToolFrameworkCore and WCSim,
- Continuous Integration and Docker support,
- package exportation via CMake.

Note that the CI of this template are not guaranteed to work if used outside the hyperk organisation.

## Defining your own repo

Below, we assume you have already install ``hk-pilot`` and the dependencies you plan to use in your future package:
as currently implemented, the ``myhklib`` relies on ToolFrameworkCore and WCSim (and their dependencies).
Therefore, make sure you have them installed!

To create a new repo:
- use the "Use this template" button, instead of forking and choose the name of your package e.g. `mypackage`,
- change the project name in ``CMakeLists.txt`` to `mypackage`,
- change the `self._package_name` in ``hkinstall.py`` to `mypackage` (same for the name of the class),
- start a first compilation using ``hkp install mypackage``
- if successful, you can start editing the source code (add more source files, applications...) and the CMake files.

TODO: create a script that does the above automatically

## Creating new tools

To create new tools:
- run the `newTool.sh` bash script,
- add `hk_add_tool(<tool_name>)` in the CMakeLists.txt file.

TODO: add documentation about the other scripts

## Continuous Integration

If you'd like to use the Continuous Integration, you would need to :
- have the new repo in the hyperk organisation (otherwise you can not access hyperk resources correctly). If so, you would have to ask a hyperk organisation owner to create the repo for you!
- ask a hyperk owner to add the repository to the allowed repositories: https://github.com/orgs/hyperk/packages/container/hk-meta-externals/settings
- add a SSH key in the `Actions secrets` for this repo
- 