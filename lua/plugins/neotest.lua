local test_file_cache = {}

return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
          args = { "--import-mode=importlib" },
          is_test_file = function(file_path)
            local cached = test_file_cache[file_path]
            if cached ~= nil then
              return cached
            end

            local is_test = false
            if file_path:match("%.py$") then
              local f = io.open(file_path, "r")
              if f then
                for line in f:lines() do
                  if line:match("^%s*def test_") or line:match("^%s*class Test") then
                    is_test = true
                    break
                  end
                end
                f:close()
              end
            end

            test_file_cache[file_path] = is_test
            return is_test
          end,
        },
      },
    },
  },
}
