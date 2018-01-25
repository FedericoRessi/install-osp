if [ "${INSTALL_OSP_BIN_DIR}" == "" ]; then
    _get_scripts_dir() {
        local scripts_dir=$(dirname "${BASH_SOURCE[0]}")
        python -c "import os; print(os.path.realpath('${scripts_dir}'))"
    }

    INSTALL_OSP_BIN_DIR="$(_get_scripts_dir)"
    unset _get_scripts_dir

    export PATH="${INSTALL_OSP_BIN_DIR}:${PATH}"
fi

if [ "${INSTALL_OSP_DIR:-}" == "" ]; then
    _get_install_osp_dir() {
        local install_osp_dir=$(dirname "${BASH_SOURCE[0]}")/../.install-osp
        python -c "import os; print(os.path.realpath('${install_osp_dir}'))"
    }

    INSTALL_OSP_DIR="$(_get_install_osp_dir)"
    unset _get_install_osp_dir
fi


alias ssh="ssh -F '${INSTALL_OSP_DIR}/ssh_config'"
