# MAS MDK Image
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/friends-of-monika/mas-mdk-image/Build%20Docker%20image%20on%20push)][5]
[![Docker pulls](https://img.shields.io/docker/pulls/friendsofmonika/mas-mdk)][4]
[![Docker image size](https://img.shields.io/docker/image-size/friendsofmonika/mas-mdk/latest)][4]
[![Discord server](https://discordapp.com/api/guilds/970747033071804426/widget.png?style=shield)][6]

Monika After Story Mod Development Kit Image is a project aimed to provide easy
to use Docker image with necessary Ren'Py SDK and Doki Doki Literature Club
distributions included as well as latest Monika After Story release to allow one
to perform code linting and unit testing.

New MAS MDK images are built with every new MAS updates (stable channel) with
update checks performed daily. In the event of new update released, MAS MDK
image will be automatically built within 24 hours (at most.)

## Credits

Huge thanks to [@multimokia][1] for hosting [ddlc-mod-base][2] Docker image that
is used with this project and for the idea of it.

Doki Doki Literature Club is created by Team Salvato, all rights reserved.
Repository owners, contributors or maintainers do not claim ownership over the
title/game and are not associated with Team Salvato in any way. [Project license][3]
only applies to project files stored in this repository and do not cover other
people/organization work used in this project.


[1]: https://github.com/multimokia
[2]: https://hub.docker.com/r/multimokia/ddlc-mod-base
[3]: https://github.com/Friends-of-Monika/mas-mdk-image/blob/master/license.txt
[4]: https://hub.docker.com/repository/docker/friendsofmonika/mas-mdk
[5]: https://github.com/Friends-of-Monika/mas-mdk-image/actions/workflows/push-build.yml
[6]: https://mon.icu/discord