require 'mp.options'
local opt = {
    patterns = {
        "OP","[Oo]pening$", "^[Oo]pening:", "[Oo]pening [Cc]redits",
        "ED","[Ee]nding$", "^[Ee]nding:", "[Ee]nding [Cc]redits",
        "[Pp]review$",
    },
}
read_options(opt)

function check_chapter(_, chapter)
    if not chapter then
        return
    end
    for _, p in pairs(opt.patterns) do
        if string.match(chapter, p) then
            print("Skipping chapter:", chapter)
            mp.command("no-osd add chapter 1")
            return
        end
    end
end

mp.observe_property("chapter-metadata/by-key/title", "string", check_chapter)
