local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local extras = require("luasnip.extras")
local rep = extras.rep
local dl = extras.dynamic_lambda


return {
  -- python functions 
      -- print
      s("pr", {
        t("print("), i(1, '"Hello, world!"'), t(")")
      }),

      -- print f str
      s("prf", {
        t('print(f"'), i(1, 'Hello, world!'), t('")')
      }),

      -- pprint
      s("ppr", {
        t('__import__("pprint").pprint('), i(1, 'obj'), t(")")
      }),
  

  -- Functions and methonds
      -- def
      s("def", {
        t("def "), i(1, "func_name"), t("("), i(2, ""), t({"):", "\t"}), 
            t('"""'), i(3, "doc"), t({'"""', "\t"}),
            i(4, '')
      }),

      -- async def
      s("defa", {
        t("async def "), i(1, "func_name"), t("("), i(2, ""), t({"):", "\t"}), 
            t('"""'), i(3, "doc"), t({'"""', "\t"}),
            i(4, '')
      }),

      -- method
      s("met",{
          t('def '), i(1, "func_name"), t("(self, "), i(2), t({"):", "\t"}), 
            t('"""'), i(3, "doc"), t({'"""', "\t"}),
            i(4, '')
      }),
     
      -- method name: __name__
      s("metd",{
          t('def '), t("__"), i(1, "func_name"), t("__(self, "), i(2), t({"):", "\t"}), 
            t('"""'), i(3, "doc"), t({'"""', "\t"}),
            i(4, '')
      }),

      -- async method
      s("meta",{
          t('async def '), i(1, "func_name"), t("(self, "), i(2), t({"):", "\t"}), 
            t('"""'), i(3, "doc"), t({'"""', "\t"}),
            i(4, '')
      }),

        -- init 
      s("init",{
          t('def '), t("__init__"), t("(self, "), i(1), t({"):", "\t"}), 
            t("self."), rep(1), t(" = "), rep(1)
      }),

      -- self.atr = atr
      s("sa", {
          t("self."), i(1, "atr"), t(" = "), rep(1)
      }),


  -- utils
      -- from ... import ...
      s("from", {
          t("from "), i(1, "package"), t(" import "), i(2, "module")
      }),

      -- dander 
      s("_", {
        t("__"), i(1, "name"), t("__")
      }),

      -- doc  -- FIX: end extra ". Из за того что автодополнение к этой кавчки печает еще одну
      s('"', {
          t({'"""', ""}), i(1, "doc"), t('"""')
      }),
 
      -- try/excep
      s("try", {
        t({"try:", "\t"}), 
            i(1, "pass"),
        t({"", "except "}), i(2, "Exception"), t(" as "), i(3, "e"), t({":", "\t"}),
            i(4, "pass")
      }),


  -- class
      -- class    
      s("cl", {
        t("class "), i(1, "Name"), t({":", "\t"}), 
            t('"""'), i(2, "doc"), t({'"""', "\t"}),
            i(3, '')
      }), 

      -- data class
      s("cld", {
        t({"@dataclass", ""}), 
        t("class "), i(1, "Name"), t({":", "\t"}), 
            i(2, "field"), t(": "), i(3, "type"),
      }), 


  -- args kwargs
      -- get kwargs in var
      s("kwg", {
          i(1, "var_name"), t(' = kwargs.get("'), rep(1), t('", '), i(2, "None"), t(')') 
      }),

      -- get kwargs in SELF var
      s("kwgs", {
          t("self."), i(1, "var_name"), t(' = kwargs.get("'), rep(1), t('", '), i(2, "None"), t(')') 
      }),

      -- *args, **kwargs
      s("akw", {
          t("*args, **kwargs"), i(1, ", ")
      }),
  

  -- logger
    s("lc", {
        t('logger.critical(f"'), i(1, "msg"), t('")')
    }),

    s("le", {
        t('logger.error(f"'), i(1, "msg"), t('")')
    }),

    s("lw", {
        t('logger.warning(f"'), i(1, "msg"), t('")')
    }),

    s("li", {
        t('logger.info(f"'), i(1, "msg"), t('")')
    }),

    s("ld", {
        t('logger.debug(f"'), i(1, "msg"), t('")')
    }),
}

