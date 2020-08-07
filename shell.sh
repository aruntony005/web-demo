docker build -t my-demo web-demo/

sudo docker save -o /root/demo-image.tar `docker images --no-trunc | grep -i my-demo | awk '{print $3}'`

sudo scp -i /root/.ssh/id_rsa /root/demo-image.tar root@worker:/root/

ssh worker "sudo docker load -i /root/demo-image.tar"

image_id=`docker images --no-trunc | grep -i my-demo | awk '{print $3}'`

sed "s/WEB-IMAGE/$image_id/g" web-demo/web-deploy.yaml_template > web-demo/web-deploy.yaml

kubectl delete deployment.apps/web-demo
kubectl delete service/web-demo

kubectl create -f demo/web-deploy.yaml
kubectl create -f demo/web-service.yaml
