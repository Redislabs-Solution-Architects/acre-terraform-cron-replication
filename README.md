[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

# ACRE-TERRAFORM-CRON-REPLICATION

Deploy Azure Cache for Redis Enterprise (ACRE) in two separate regions with scheduled replication from primary to secondary.

## | [Getting Started](#getting-started) | [About](#about) | [See Also](#see-also)  | [License](#license) |

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* Azure CLI

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/redisgeek/acre-terraform-cron-replication.git --recurse-submodule
   ```


## About The Project

Can be used as part of multiple solutions:
- Provide DR where active-active is not yet available.
- Provide DR for RediSearch, RedisTimeSeries and RedisBloom, modules in ACRE.
- Serve as a base for use cases besides DR, like .

The primary cluster, deployed across 3-AZs, will have a 99.99 SLA that is financially backed by Azure.
There are no "preview" features included in this reference implementation.
The components used in this solution are all Generally Available (GA).

The functions automate the following:

- export the primary cluster as a snapshot (rdb)
- copy rdb to secondary region
- import rdb to secondary (DR) cluster

## Overview

![Architecture Overview](images/v1.png)


### Built With

* [Terraform](https://terraform.io)

### Roadmap

See the [open issues](https://github.com/redisgeek/acre-terraform-cron-replication/issues) for a list of proposed features (and known issues).


### Contributing

Pull-requests are welcomed!

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

DaShaun - [@dashaun](https://twitter.com/dashaun)

Project Link: [https://github.com/redisgeek/acre-terraform-cron-replication](https://github.com/redisgeek/acre-terraform-cron-replication)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Deploying an Azure Function App with Terraform](https://adrianhall.github.io/typescript/2019/10/23/terraform-functions/)
* [Deploy Azure Functions with Terraform](https://www.maxivanov.io/deploy-azure-functions-with-terraform/)

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
