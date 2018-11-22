#!/bin/sh
set -o errexit

# enable the below line to print execution steps
# set -o xtrace

# check_dependencies not used for now. 
function check_dependencies(){
  echo "checking dependencies..."
  jq --version >/dev/null 2>&1
  res=$?
  echo "RES: $res"
  if [[ $res > 0 ]]; then 
    echo "JQ not found...installing.."
    yum install jq -y
  fi
}


function usage(){
  cat <<HEREDOC
  Usage:
    option --stack-id id-of-the-stack-where-the-operation-has-be-performed
    option --region   us-east1 or eu-central-1 or other region
    option --action   delete or stop

  Sample: 
    user$ ./instance.sh --stack-id xxx-xxxx-xxx-xxxx-xx --region us-east-1 --action stop
    user$ ./instance.sh --stack-id xxx-xxxx-xxx-xxxx-xx --region us-east-1 --action delete
HEREDOC

}

function stop_instances(){
  for i in ${instance_list}; do 
    echo "Stopping instance: $i"
    $(aws opsworks stop-instance --region $1 --instance-id $i)
  done 
}

function delete_instance(){
  for i in ${instance_list}; do 
    echo "Deleting instance: $i"
    $(aws opsworks delete-instance --region $1 --instance-id $i)
  done 
}

function get_instance_array(){
  instance_list=$(aws opsworks describe-instances --region $2 --stack-id $1 | jq -r '.["Instances"][] | .InstanceId')
}



stack_id=""
region=""
action=""
operation=""

# check_dependencies



while [ "$#" -gt 0 ]; do 
  case $1 in 
    "--help")
      echo "Right now please help yourself.."
      usage
      exit
      ;;
    "--stack-id")
      stack_id=$2
      echo -e "Stack id is $2\n"
      shift 2
      ;;
    "--region")
      region=$2
      echo -e "Region is $2\n"
      shift 2
      ;;
    "--action")
      action="$2"
      echo -e "Action is $2\n"
      shift 2
      ;;
    *)
      echo "Unknown option"
      exit 1
  esac
done

echo -e "=================\nStack id: $stack_id\nRegion  : $region\n================="

case $action in
  "delete")
    if [[ ! -z $stack_id ]] && [[ ! -z $region ]]; then 
      echo "Delete instances..."
      get_instance_array $stack_id $region
      delete_instance $region
    fi
    ;;
  "stop")
    if [[ ! -z $stack_id ]] && [[ ! -z $region ]]; then 
      echo "Stopping instances"
      get_instance_array $stack_id $region
      stop_instances $region
    fi
    ;;
  *)
    echo "Unknown action"
    exit 1
esac