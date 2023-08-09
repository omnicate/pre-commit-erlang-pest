[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

# pre-commit-erlang-pest
A pre-commit hook that integrates [PEST](https://github.com/okeuday/pest) SAST scans on Erlang code.

## Configuration
Add the following config to your `.pre-commit-config.yaml`
```
  - repo: https://github.com/omnicate/pre-commit-erlang-pest 
    rev: v1.0.4
    hooks:
      - id: pest
```
And test your repo

`❯❯❯ pre-commit run pest --all-files -v`

Example output:
```
❯❯❯ pre-commit run pest --all-files -v
[INFO] Initializing environment for https://github.com/omnicate/pre-commit-erlang-pest.
[INFO] Installing environment for https://github.com/omnicate/pre-commit-erlang-pest.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
SAST:pest - Erlang Security Testing (via Docker build).......................Failed
- hook id: pest
- duration: 4.71s
- exit code: 1

15: Keep OpenSSL updated for crypto module use (run with "-V crypto")
     goodday.erl:34 (compile:forms/2)
 10: Dynamic creation of atoms can exhaust atom memory
     your_app_config.erl:209 (file:consult/1)
 15: Keep OpenSSL updated for crypto module use (run with "-V crypto")
     whoops.erl:34 (compile:forms/2)
 15: Keep OpenSSL updated for crypto module use (run with "-V crypto")
     heihei.erl:81 (crypto:_/_)
 15: Keep OpenSSL updated for crypto module use (run with "-V crypto")
     tomato.erl:121 (crypto:_/_)
     yolo.erl:[127,139] (crypto:_/_)
 15: Keep OpenSSL updated for crypto module use (run with "-V crypto")
     oslo.erl:38 (crypto:_/_)
```
