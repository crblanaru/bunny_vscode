# bunny_vscode
Please note that you need to add 2 environment variables: HASHED_PASSWORD and  SUDO_PASSWORD_HASH

To generate them use:

SUDO_PASSWORD_HASH: mkpasswd --method=SHA-512 --stdin

HASHED_PASSWORD: echo -n "secret_password" | npx argon2-cli -e

These will control access to the application.
