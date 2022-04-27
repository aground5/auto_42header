#!/bin/sh

ps -ef | awk '{print $2}' | xargs kill -9
