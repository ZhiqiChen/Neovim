local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        show_tab_indicators = true,
        show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true,
            },
        },
    },
})
