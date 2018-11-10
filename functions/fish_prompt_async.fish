#!/usr/bin/env fish

set caller $argv[1]

set -U sf_git_$caller (__sf_section_git_branch) (__sf_section_git_status)
kill -INFO $caller
