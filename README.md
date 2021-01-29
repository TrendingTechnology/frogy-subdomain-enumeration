# Frogy's Subdomain Enumeraton - It's not yet another Subdomain Enumeration tool
An automation tool that scans sub-domains using multiple tools. Most importantly, it greps all the words from the first, second and N level of subdomains and creates a wordlist. Then uses crt.sh to brute force every single name to identify any hidden subdomains out there. <br/>

![Untitled Diagram(1)](https://user-images.githubusercontent.com/8291014/106329881-23239a00-627a-11eb-95a8-fcb4301c60d9.jpg)

+ **Requirements:** Go Language, Python 3.+, jq
+ **Tools used - You must need to install these tools to use this script**<br/>

  + [SubFinder](https://github.com/projectdiscovery/subfinder)
  + [Sublist3r](https://github.com/aboul3la/Sublist3r)
  + [Assetfinder](https://github.com/tomnomnom/assetfinder)
  + [Find-domain](https://github.com/Findomain/Findomain)
  + [httprobe](https://github.com/tomnomnom/anew)
  + [anew](https://github.com/tomnomnom/httprobe)
  
+ **Installation**

    ```sh
    apt install jq
    git clone https://github.com/iamthefrogy/frogy-subdomain-enumeration.git && cd frogy-subdomain-enumeration/ && chmod +x frogy.sh
    ```
+ **Usage**

    ```sh
    ./frogy.sh
    ```

#### Thanks to the authors of the tools used in this script.

**Warning:** This is just a research project. Kindly use it with caution and at your own risk.
