-- Essential vim enhancements for a more vim-like experience
return {
  -- Better text objects
  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },
  
  -- Vim surround for dealing with pairs
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  
  -- Better . repeat functionality  
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  
  -- Comment with gcc/gc
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  
  -- Better f/F/t/T
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },
  
  -- Show marks in sign column
  {
    "kshenoy/vim-signature",
    event = "VeryLazy",
  },
}
