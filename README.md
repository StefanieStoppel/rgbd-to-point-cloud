# From RGB-D images to Complete Point Clouds.

![gif-rgb-d-to-pc](https://user-images.githubusercontent.com/1161007/111666659-37186080-8814-11eb-8685-5561bdfdaf08.gif)


This repository represents the end-to-end pipeline of our 
multi-stage RGB-D image to point cloud completion architecture using two deep neural networks.
It contains the following components:
- Web Component: RESTful web client for uploading [YCB-Video data set](https://rse-lab.cs.washington.edu/projects/posecnn/)
  frames and specifying the object you want to complete.
- VSN Component: Contains the customized Vanilla SegNet model for semantic segmentation and its dependencies.
- MSN Component: Contains the customized Morphing and Sampling Network for point cloud completion and its dependencies.

Each of the components is containerized using Docker, thus they are all self-contained so
that no dependencies need to be installed other than Docker the ones listed below in the setup instructions.

Watch this ![video](https://user-images.githubusercontent.com/1161007/111665926-80b47b80-8813-11eb-8607-e98cf8232e54.mp4) to see the GUI in action.
You can also find more details on the project [here](https://basecamp-demos.informatik.uni-hamburg.de/expo2020/entries/from-depth-images-to-complete-point-clouds/).

## Setup
> Beware that you need a GPU to run the pipeline!

1. Download the [Docker](https://www.docker.com/get-started) client for your OS.
   > If you are on a Linux system, make sure to add your user to the docker group as described [here](https://docs.docker.com/engine/install/linux-postinstall/).
2. The Morphing and Sampling Network can only be executed on a GPU, hence you will also need [Nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker).
2. Install [Node.js](https://nodejs.org/en/)
3. Install [yarn](https://classic.yarnpkg.com/en/docs/install)
4. Clone this repository locally.

## Run instructions

1. Run `bash setup.sh` in the root of this repo to clone the VSN, MSN and Web Component repos
   and to create the necessary files on your machine automatically. Be patient, it takes a while initially :) 
   By default, all the files will be created in the directory `$HOME/Desktop/CVP`.
   If you want to change this, you can pass a different path using the `-d` option when running setup.sh.
2. Download both network weight files from [GDrive](https://drive.google.com/drive/folders/164PTAuxcxPCLKB0ptZwnFO0mbNiLaUSP?usp=sharing) 
   and move them to `$HOME/Desktop/CVP/pipeline/models` 
   or under `pipeline/models` at the custom location you specified using `-d`.
3. Run `bash ./run/start-web-app.sh`. Add the `-d` option if you used it while running setup.sh.
4. In a new terminal window run `bash ./run/start-vsn.sh`. Add the `-d` option if you used it while running setup.sh.
5. In a new terminal window run `bash ./run/start-msn.sh`. Add the `-d` option if you used it while running setup.sh.
6. Navigate to [http://0.0.0.0:5000](http://0.0.0.0:5000) to see the Web Component's user interface.
7. Pick the YCB object you want to create a completed point cloud for in the dropdown.
8. Select files from the `$HOME/Desktop/CVP/pipeline/example_inputs` directory (or where you specified using `-d`)
   corresponding to the object you picked (banana, bleach cleanser, power drill or scissors).
   Make sure to select all files belonging to the frame: `<frame-id>-color.png`, `<frame-id>-depth.png` and `<frame-id>-meta.mat`.
9. Wait for the completion to finish. It will take 15+ seconds for both networks to process the inputs (depends on your GPU).
10. Enjoy the resulting partial and completed point cloud displays directly in the browser. 
You can zoom in and rotate them within the display windows.

### Component repos
You can check out the other component repos on [Gitlab](https://gitlab.com/cvp1).

### Original network repos
- Vanilla Segnet: https://github.com/j96w/DenseFusion
- Morphing and Sampling Network: https://github.com/Colin97/MSN-Point-Cloud-Completion
