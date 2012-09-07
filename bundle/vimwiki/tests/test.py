#!/usr/bin/python
# vim:shiftwidth=4:softtabstop=4:expandtab:foldmethod=marker

"""Test vimwiki's HTML generator.
"""

import os
import os.path
import fnmatch
#from glob import glob

# There is no raw_input in python 3 
try:
    myinput = raw_input
except:
    myinput = input

def get_testname(filename, wikipath):
    return os.path.splitext(os.path.relpath(filename, wikipath))[0]

def touch(fname):
    with open(fname, 'a'):
        os.utime(fname, None)

def touch_test_wikies():
    for root, dirnames, filenames in os.walk('wiki'):
        for filename in fnmatch.filter(filenames, '*.wiki'):
            touch(os.path.join(root, filename))

def gen_vimwiki_htmls():
    # Generate HTML using vimwiki.
    vimrc_path = 'vimrc'
    vim_command = "exe 'VimwikiIndex' | exe 'VimwikiAll2HTML' | quit"
    command = 'vim -n -u "%s" -c "%s"' % (vimrc_path, vim_command)

    return os.system(command)


def test_all():
    print("Testing...")
    count = 0
    failed_count = 0

    failed_tests = []

    # Compare actual HTML with expected one.
    tests = []
    for root, dirnames, filenames in os.walk('wiki'):
        for filename in fnmatch.filter(filenames, '*.wiki'):
            tests.append(get_testname(os.path.join(root, filename), 'wiki'))
    for test in tests:
        expected_name = os.path.join('expected_html', test+'.html')
        actual_name = os.path.join('html', test+'.html')
        if os.path.exists(expected_name):
            expected = open(expected_name).read()
        else:
            print("Missing expected output file: {}".format(expected_name))
            expected = ''
        if os.path.exists(actual_name):
            actual = open(actual_name).read()
        else:
            print("Missing actual output file: {}".format(actual_name))
            actual = ''

        if expected == actual:
            count += 1
        else:
            failed_count += 1
            failed_tests.append((expected_name, actual_name))

    print("Tests count: {}".format(count+failed_count))
    print("Tests succeeded: {}".format(count))
    print("Tests failed: {}".format(failed_count))

    if failed_count == 0:
        print("Ok!")
    else:
        print("Fail!")

    return failed_tests


def main():
    print("Converting wiki to html...")
    touch_test_wikies()
    if gen_vimwiki_htmls() != 0:
        raise Exception("vim failed with status %d" % status)

    failed_tests = test_all()
    for expected, actual in failed_tests:
        question = "Would you like to vimdiff failed test named '{}'? (y/n) "
        print ('vim -d "%s" "%s"' % (expected, actual))
        answer = myinput(question.format(get_testname(expected, 'wiki')))
        if answer == 'y':
            command = 'vim -d "%s" "%s"' % (expected, actual)
            os.system(command)



if __name__ == '__main__':
    main()

