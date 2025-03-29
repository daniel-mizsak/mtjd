## Secrets
If you are me, consider settings **secrets**:
```bash
gh auth login --git-protocol https --skip-ssh-key --web
gh repo clone secrets ~/secrets
cd ~/secrets
./decrypt.sh
```

The password is: `***`.
