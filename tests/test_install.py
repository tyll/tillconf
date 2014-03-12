#!/usr/bin/python -tt
# vim: fileencoding=utf8

import os
import subprocess


def wrap_install(*args):
    testsdir = os.path.dirname(os.path.realpath(__file__))
    parentdir = os.path.realpath(os.path.join(testsdir, ".."))
    installfile = os.path.join(parentdir, "tillconf-install")
    wrapperfile = os.path.join(testsdir, "function-wrapper.sh")

    cmd = [wrapperfile, installfile]
    cmd.extend(args)

    output = subprocess.check_output(cmd)
    return output


def assert_commonprefix(path1, path2, expected):
    output = wrap_install("commonprefix", path1, path2)
    assert output == expected
    output = wrap_install("commonprefix", path2, path1)
    assert output == expected


class TestInstall(object):
    def test_commonprefix(self):
        assert_commonprefix("/", "/", "/\n")
        assert_commonprefix("/foo", "/", "/\n")
        assert_commonprefix("/foo", "/fu", "/\n")
        assert_commonprefix("/foo/bar", "/foo", "/foo\n")
