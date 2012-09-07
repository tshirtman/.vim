import os

def mk_header():
    lines = ['" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.',
             'UseVimball',
             'finish']
    return lines

def mk_single_vimball(path, fname):
    result = [fname+'\t[[[1']
    with open(os.path.join(path, fname), "r") as file:
        lines = [line.rstrip() for line in file]
        result.append(str(len(lines)))
        result.extend(lines)
    return result

# # python 3k
# def mk_vimball(path, fnames, vba_name):
    # with open(vba_name, "w", newline='\n') as vba_file:
        # lines = mk_header()
        # for fname in fnames:
            # lines.extend(mk_single_vimball(path, fname))
        # for line in lines:
            # vba_file.write(line+'\n')

# python 2.6
def mk_vimball(path, fnames, vba_name):
    with open(vba_name, "wb") as vba_file:
        lines = mk_header()
        for fname in fnames:
            lines.extend(mk_single_vimball(path, fname))
        for line in lines:
            vba_file.write(line+'\n')
