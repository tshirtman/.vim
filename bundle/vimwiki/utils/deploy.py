#! /usr/bin/python
"""
Vimwiki deployment script.
    * Make Vimball archive (vba) file in DEPLOY_DIR directory.
    * Zip vimwiki files into 'DEPLOY_DIR/vimwiki-{VERSION}.zip'
    * Zip vba file into 'DEPLOY_DIR/vimwiki-{VERSION}-vba.zip'
    * gz vba file into 'DEPLOY_DIR/vimwiki-{VERSION}.vba.gz'
"""

from __future__ import print_function
import os
import glob
import shutil
import re
from datetime import date

import zipfile
import gzip

import mkvimball as vba


# Settings
DEPLOY_DIR = os.path.expanduser("../deploy/")
SRC_DIR = os.path.expanduser("../src/")


def get_vimwiki_version():
    with open(SRC_DIR + 'doc/vimwiki.txt') as f:
        for line in f:
            r = re.search('Version:\s*(\S*)', line)
            if r:
                return r.groups()[0]


def vimwiki_files(src_dir):
    for root, dirs, files in os.walk(src_dir):
        root = root.replace(src_dir, '')
        for f in files:
            if f.endswith(('.vim','.txt','.css','.tpl')):
                f = os.path.join(root, f)
                yield f


def make_vba_file(src_dir, vba_file_name):
    try:
        os.makedirs(os.path.dirname(vba_file_name))
    except:
        pass

    inc_names = [f for f in vimwiki_files(src_dir)]
    vba.mk_vimball(src_dir, inc_names, vba_file_name)


def make_zip_folder(folder, arcname):
    try:
        os.makedirs(os.path.dirname(arcname))
    except:
        pass

    arc = zipfile.ZipFile(arcname, "w")
    for f in vimwiki_files(folder):
        arc.write(os.path.join(folder, f), f, zipfile.ZIP_DEFLATED)
    arc.close()


def make_zip_vba(vba_name, zip_vba_name):
    arc = zipfile.ZipFile(zip_vba_name, "w", zipfile.ZIP_DEFLATED)
    arc.write(os.path.join(DEPLOY_DIR, vba_name), vba_name)
    arc.close()


def make_gzip_vba(vba_name, full_vba_name):
    f_in = open(full_vba_name, 'rb')
    f = open(full_vba_name+'.gz', 'wb')
    f_gzout = gzip.GzipFile(vba_name, 'wb', 9, f)
    f_gzout.writelines(f_in)
    f_in.close()
    f_gzout.close()
    f.close()


if __name__ == "__main__":
    ver = get_vimwiki_version().replace('.', '-')
    print("Getting vimwiki version: {0}".format(ver))

    vba_name = "vimwiki-{0}.vba".format(ver)
    path_vba_name = os.path.join(DEPLOY_DIR, vba_name)
    print("Creating vba file: {0}".format(path_vba_name))
    make_vba_file(SRC_DIR, path_vba_name)

    zip_name = "vimwiki-{0}.zip".format(ver)
    path_zip_name = os.path.join(DEPLOY_DIR, zip_name)
    print("Packing src files into: {0}".format(path_zip_name))
    make_zip_folder(SRC_DIR, path_zip_name)

    zip_dev_name = "vimwiki-dev-{0}.zip".format(date.today().isoformat())
    path_zip_dev_name = os.path.join(DEPLOY_DIR, zip_dev_name)
    shutil.copy(path_zip_name, path_zip_dev_name)
    print("Making dev package: {0}".format(path_zip_dev_name))

    zip_vba_name = "vimwiki-{0}-vba.zip".format(ver)
    path_zip_vba_name = os.path.join(DEPLOY_DIR, zip_vba_name)
    print("Packing vba file into: {0}".format(path_zip_vba_name))
    make_zip_vba(vba_name, path_zip_vba_name)

    print("Packing vba file into: {0}".format(path_vba_name+".gz"))
    make_gzip_vba(vba_name, path_vba_name)
