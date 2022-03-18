# jzwiki

jzwiki is a simple and opinionated help.vim-based "wiki" system for my personal rapid documentation use. Feel free to hack it up to suit your own needs.

## Usage

All files should have the `.txt` extension. Links use the standard helptags system and so inherit their restrictions.

## Syntax

The syntax is a mishmash of markdown, help.vim, and a touch of Org-mode. It has the following:

- `*anchor_name*`: Hyper text entry, this marks the jump-to anchor.
    - Please note that for hyper text entries and names, they must not contain spaces. If it is not highlighted as a link, it won't work.
- `|link_name|`: Hyper text link, you use `<C-]>` on this to jump to the corresponding anchor.
- `# Title`: Supports any number of `#` symbols. Works like markdown titles.
- `` `code text` ``: Text that is code, coloured like a comment.
- Triple backtick code blocks also treated like code, a la markdown.
- `{emphasis}`: Bold text.
- `/emphasis/`: Italic text.
- `_emphasis_`: Underlined text.
- `[ ]` (incomplete), `[x]` (complete), `[-]` (aborted): Checkboxes, three states.
- `<special>`: Emphasized text (angular braces are not concealed).
- Special highlighted words:
    - `vim: ...`: The vim modeline. Useful to treat `.txt` files as `jzwiki` filetype.
    - `(prev|next|status|error):` (colon necessary): For special hyperlinks or highlights.

## Built-in commands

All commands are normal mode and designed to work with the limitations of this format:

- `<Leader>ht`: Generate help tags (you should do this from the root of the wiki since it calls `:helptags ./`).
    - Then, you can use the standard `<C-]>` to jump to tags under the cursor and the standard set of `<C-o>`, `<C-i>` to move back and forth.
- `<Leader>hl`: Generate a 79-character line of hyphens.
- `<Leader>hL`: Insert a basic template including a link to `index` and a modeline.
- `<Leader>hC`: Create the file name linked under the cursor and insert a basic template containing a link to `index`, an anchor for the link name, and a modeline.
- `<Leader>tt`: Toggle the state of the checkbox on the current line between complete/incomplete.
