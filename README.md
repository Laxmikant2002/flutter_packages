0. **Generate a new SSH key:**
    ```sh
    ssh-keygen -t ed25519 -C "your_email@example.com"

1. **Start the ssh-agent service:**
    ```sh
    Start the ssh-agent service:

2. **Add your SSH key to the ssh-agent:**
    ```sh
    ssh-add ~/.ssh/id_ed25519

3. **Add the SSH key to your GitHub account:**
    ```sh
    cat ~/.ssh/id_ed25519.pub

4. **clip < ~/.ssh/id_ed25519.pub**
    ```sh
    clip < ~/.ssh/id_ed25519.pub

5. **Go to GitHub SSH and GPG keys settings.**

6. **Click "New SSH key", provide a title, and paste your key.**

7. **Test your SSH connection:**
    ```sh
    ssh -T git@github.com

8. **Push your changes again:**
    ```sh
    git push -u origin master
