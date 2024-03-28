#!/bin/bash
export CARLA_ROOT=/data3/jiale/carla/CARLA_0.9.14/
export CARLA_SERVER=${CARLA_ROOT}/CarlaUE4.sh
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.14-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:leaderboard
export PYTHONPATH=$PYTHONPATH:leaderboard/team_code
export PYTHONPATH=$PYTHONPATH:scenario_runner

export LEADERBOARD_ROOT=leaderboard
export CHALLENGE_TRACK_CODENAME=SENSORS
export PORT=2000
export TM_PORT=8000
export DEBUG_CHALLENGE=0
export REPETITIONS=1 # multiple evaluation runs
export RESUME=1


# TCP evaluation
#export ROUTES=leaderboard/data/evaluation_routes/routes_lav_valid.xml
export ROUTES=leaderboard/data/evaluation_routes/routes_lav_valid_town05.xml
#use town01_val for evaluation
#export ROUTES=leaderboard/data/TCP_training_routes/routes_town07_val.xml

#export TEAM_AGENT=team_code/tcp_agent.py
export TEAM_AGENT=team_code/roach_ap_agent.py
#export TEAM_AGENT=team_code/auto_pilot.py

#export TEAM_CONFIG=checkpoint/TCP_result/res50_ta_4wp_103+10ep.ckpt
export TEAM_CONFIG=roach/config/config_agent.yaml

export CHECKPOINT_ENDPOINT=results_ofares50_eva.json
export SCENARIOS=leaderboard/data/scenarios/all_towns_traffic_scenarios.json
#export SAVE_PATH=data/evaluation

#choose to debug or not



#python3 ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator.py \
python3 -m debugpy --listen 42460 --wait-for-client ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator.py \
--scenarios=${SCENARIOS}  \
--routes=${ROUTES} \
--repetitions=${REPETITIONS} \
--track=${CHALLENGE_TRACK_CODENAME} \
--checkpoint=${CHECKPOINT_ENDPOINT} \
--agent=${TEAM_AGENT} \
--agent-config=${TEAM_CONFIG} \
--debug=${DEBUG_CHALLENGE} \
--record=${RECORD_PATH} \
--resume=${RESUME} \
--port=${PORT} \
--trafficManagerPort=${TM_PORT}


