[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/redisgeek/acre-terraform-cron-replication">
    <img src="images/redis-icon.svg" alt="Logo" width="80" height="80">
  </a>
</p>

<h3 align="center">Azure Cache for Redis Enterprise (ACRE) with scheduled exports for active-passive DR</h3>

  <p align="center">
    ACRE, active-passive DR for regions that don't yet have active-active, and for use with modules. 
    <br />
    <a href="https://github.com/redisgeek/acre-terraform-cron-replication"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/redisgeek/acre-terraform-cron-replication">View Demo</a>
    ·
    <a href="https://github.com/redisgeek/acre-terraform-cron-replication/issues">Report Bug</a>
    ·
    <a href="https://github.com/redisgeek/acre-terraform-cron-replication/issues">Request Feature</a>
  </p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This solution can be used to provide DR where active-active is not yet available.
The solution can also provide DR for RediSearch, RedisTimeSeries and RedisBloom, modules in ACRE.
This solution could also serve as a base for use cases besides DR, like testing.

The primary cluster, deployed across 3-AZs, will have a 99.99 SLA that is financially backed by Azure.
There are no "preview" features included in this reference implementation.
The components used in this solution are all Generally Available (GA).

The functions automate the following:

- export the primary cluster as a snapshot (rdb)
- copy rdb to secondary region
- import rdb to secondary (DR) cluster

### Built With

* [Terraform](https://terraform.io)

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* Azure CLI

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/redisgeek/acre-terraform-cron-replication.git --recurse-submodule
   ```


<!-- USAGE EXAMPLES -->
## Usage

<br />
<p align="center">
  <a href="https://github.com/redisgeek/acre-terraform-cron-replication">
    <img src="images/v1.png" alt="architecture diagram" height="25%" width="25%">
  </a>
</p>


<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/redisgeek/acre-terraform-cron-replication/issues) for a list of proposed features (and known issues).


<!-- CONTRIBUTING -->
## Contributing

Pull-requests are welcomed!

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## Contact

DaShaun - [@dashaun](https://twitter.com/dashaun)

Project Link: [https://github.com/redisgeek/acre-terraform-cron-replication](https://github.com/redisgeek/acre-terraform-cron-replication)


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/redisgeek/acre-terraform-cron-replication.svg?style=for-the-badge
[contributors-url]: https://github.com/redisgeek/acre-terraform-cron-replication/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/redisgeek/acre-terraform-cron-replication.svg?style=for-the-badge
[forks-url]: https://github.com/redisgeek/acre-terraform-cron-replication/network/members
[stars-shield]: https://img.shields.io/github/stars/redisgeek/acre-terraform-cron-replication.svg?style=for-the-badge
[stars-url]: https://github.com/redisgeek/acre-terraform-cron-replication/stargazers
[issues-shield]: https://img.shields.io/github/issues/redisgeek/acre-terraform-cron-replication.svg?style=for-the-badge
[issues-url]: https://github.com/redisgeek/acre-terraform-cron-replication/issues
[license-shield]: https://img.shields.io/github/license/redisgeek/acre-terraform-cron-replication.svg?style=for-the-badge
[license-url]: https://github.com/redisgeek/acre-terraform-cron-replication/blob/master/LICENSE.txt
