# Pipeline
This repository represents the end-to-end pipeline of our 
multi-stage depth image to point cloud completion architecture.
It contains the following components:
- Web Component: RESTful web client for uploading YCB-Video frames and specifying objects to complete.
- VSN Component: Contains the Vanilla SegNet model for semantic segmentation and its dependencies.
- MSN Component: Contains the Morpgin and Sampling Network for point cloud completion and its dependencies.

Each of the components is containerized using Docker, thus they are all self-contained so
that no dependencies need to be installed other than Docker itself.

## Setup
> Beware that you need a GPU to run the pipeline!

1. Download the [Docker](https://www.docker.com/get-started) client for your OS.
1. [Create a Gitlab.com account](https://gitlab.com/users/sign_in?redirect_to_referer=yes) and [add an 
SSH key to your account](https://docs.gitlab.com/ee/ssh/).
3. Clone this repository locally by running `git clone git@gitlab.com:cvp1/pipeline.git` in a directory of your choice.
It will take a while as the network models are both contained in it.


## Run instructions

1. Run `bash setup.sh` in the root of this repo to clone the VSN, MSN and Web Component repos
 and to create the necessary files on your machine automatically. Be patient, it takes a while initially :) 
By default, all the files will be created in the directory `$HOME/Desktop/CVP`.
If you want to change this, you can pass a different path using the `-d` option when running setup.sh.
3. Run `bash ./run/start-web-app.sh`. Add the `-d` option if you used it while running setup.sh.
4. In a new terminal window run `bash ./run/start-vsn.sh`. Add the `-d` option if you used it while running setup.sh.
5. In a new terminal window run `bash ./run/start-msn.sh`. Add the `-d` option if you used it while running setup.sh.
6. Navigate to [http://0.0.0.0:5000](http://0.0.0.0:5000) to see the Web Component's user interface.
7. Pick the YCB object you want to create a completed point cloud for in the dropdown.
8. Select files from the `example_inputs` directory in this repository corresponding to the object you picked 
(banana, bleach cleanser, power drill or scissors).
Make sure to select all files belonging to the frame: `<frame-id>-color.png`, `<frame-id>-depth.png` and `<frame-id>-meta.mat`.
9. Wait for the completion to finish. It will take ~15 seconds for both networks to process the inputs.
10. Enjoy the resulting partial and completed point cloud displays directly in the browser. 
You can zoom in and rotate them within the display windows.

