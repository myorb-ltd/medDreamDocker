echo "Stopping containers"
./stop.sh
echo "Removing containers"
./rm.sh
eco "Starting containers"
./start.sh
