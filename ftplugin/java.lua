function jdtls()
-- Get Projet Paths
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
os.execute("mkdir " .. workspace_dir)

-- Get msaon install path
local install_path = require("mason-registry").get_package("jdtls"):get_install_path()

-- Root dir
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- get the current OS
local os
if vim.fn.has "macunix" then
  os = "mac"
elseif vim.fn.has "win32" then
  os = "win"
else
  os = "linux"
end

local config = {
    cmd = {
        'java',
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  
      '-jar',
      vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),

      '-configuration',
      install_path .. "/config_" .. os,

      '-data', workspace_dir,
    },
  
    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    -- root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    root_dir = root_dir,
  
    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
      }
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
-- return config
require('jdtls').start_or_attach(config)
    vim.notify("Starting custom jdtls config", "info")
end

require("mason-lspconfig").setup_handlers {
  ["jdtls"] = function ()
      jdtls()
  end
}
