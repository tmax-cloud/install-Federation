
# Federation 설치 가이드

## 구성 요소 및 버전
* federation verion: v0.3.0 구축 요망

## 폐쇄망 설치 가이드
* 외부 네트워크 통신이 가능한 환경에서 0.presetCN.sh를 이용하여 이미지 및 패키지 다운로드 후 2.2.initCN.sh를 이용하여 폐쇄망에 Federation
* 외부 네트워크 환경 스크립트 실행순서
    ```bash
    $ source version.conf
    $ bash 0.presetCN.sh
    ```
    
* 폐쇄망 설치 스크립트 실행순서
    ```bash
    $ source version.conf
    $ export REGISTRY={registryIP:PORT}
    $ bash 1.1.initCN.sh
    ```

* 정상 동작 확인
    ```bash
    $ kubectl get pod -n kube-federation-system (step.0에서 설정한 namespace)
    ```
    ![image](figure/pod.JPG)
## Step 2. federation 제거
* 목적 : federation 제거
* 제거 순서 :
    * federation 제거 script 수행
    ```bash
    $ ./3.deleteFed.sh
    ```

## Install Steps(Open Network)
* Kubefedctl 설치 
    ```bash
    $ source version.conf      
    $ curl -LO https://github.com/kubernetes-sigs/kubefed/releases/download/v${VERSION}/kubefedctl-${VERSION}-${OS}-${ARCH}.tgz
    $ tar -zxvf kubefedctl-*.tgz
    $ chmod u+x kubefedctl
    $ mv kubefedctl /usr/local/bin/
    ```

* Federation 설치
    ```bash    
    $ bash 1.1.initON.sh
    ```

* 정상 동작 확인
    ```bash
    $ kubectl get pod -n kube-federation-system
    ```
    ![image](figure/pod.JPG)

## Uninstall Steps
* Federation의 CRD 제거 및 바이너리, yaml등의 리소스 삭제
    ```bash
    $ source version.conf
    $ bash 2.deleteFed.sh
    ```
