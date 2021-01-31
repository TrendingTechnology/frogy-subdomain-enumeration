# Frogy's Subdomain Enumeraton - It's not yet another Subdomain Enumeration tool
An automation tool that scans sub-domains using multiple tools. Most importantly, it greps all the words from the first, second and N level of subdomains and creates a wordlist. Then uses crt.sh to brute force every single name to identify any hidden subdomains out there. <br/>

![Frogy Subdomain Enum](https://user-images.githubusercontent.com/8291014/106365048-e06dca80-632a-11eb-810f-7e810c888837.jpg)

+ **Requirements:** Go Language, Python 3.+, jq
+ **Tools used - You must need to install these tools to use this script**<br/>

  + [SubFinder](https://github.com/projectdiscovery/subfinder) - Download and put it into the /user/bin folder with executable permission
  + [Assetfinder](https://github.com/tomnomnom/assetfinder) - Download and put it into the /user/bin folder with executable permission
  + [Find-domain](https://github.com/Findomain/Findomain) - Download and put it into the /user/bin folder with executable permission
  + [httprobe](https://github.com/tomnomnom/anew) - Download and put it into the /user/bin folder with executable permission
  + [anew](https://github.com/tomnomnom/httprobe) - Download and put it into the /user/bin folder with executable permission
  
+ **Installation**

    ```sh
    apt install jq
    git clone https://github.com/iamthefrogy/frogy-subdomain-enumeration.git && cd frogy-subdomain-enumeration/ && chmod +x frogy.sh
    ```
+ **Usage**

    ```sh
    ./frogy.sh
    ```
**TODO**
- ✅ ~~Efficient folder structure management~~
- Guide on how to find new domains for X organisation on daily basis
 
#### Thanks to the authors of the tools used in this script.

**Warning:** This is just a research project. Kindly use it with caution and at your own risk.
