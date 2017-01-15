#!/bin/bash
./easyrsa revoke Maria\ Kowalska\ \<m.kowalska@wp.pl\>
# ./easyrsa revoke Filip\ Czaplicki\ \<fc359081@students.mimuw.edu.pl\>
./easyrsa gen-crl   
