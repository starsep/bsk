#!/bin/bash
gpg --output public_key.gpg --export fc359081@students.mimuw.edu.pl
tar -czvf fc359081.tar.gz *
gpg --output fc359081_signed.tar.gz --sign fc359081.tar.gz
