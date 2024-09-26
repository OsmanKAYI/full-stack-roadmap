# DragGAN

DragGAN is a user-friendly tool that simplifies learning Photoshop by leveraging generative AI. It has capabilities about interactive point-based manipulation on the generative image manifold. Allowing effortless alterations to images with precise control and realistic results, revolutionizing the editing process.

## Documentation

- [DragGAN's Github Page](https://github.com/XingangPan/DragGAN)
- [Hugging Face to Try DragGAN](https://huggingface.co/)

## Getting Started

**Step 1:**

```bash
# clone the project
git clone git@github.com:XingangPan/DragGAN.git
# dive into project's folder
cd DragGAN
# create the environment
conda env create -f environment.yml
```

**NOTE:** If you got an error like the following,

```bash
Collecting package metadata (repodata.json): done
Solving environment: failed

ResolvePackageNotFound:
  - scipy=1.11.0
```

- use the code block below to solve that problem.

```bash
# ensure that you have the latest version of Conda installed on your system
conda update conda
# configure conda to use the "conda-forge" channel, which provides a broader range of packages
conda config --add channels conda-forge
# try creating the environment again
conda env create -f environment.yml
conda activate stylegan3
```

**Step 2:**

```bash
# install the additional requirements
pip install -r requirements
# to quickly try out Gradio visualizer in Docker, run the following
docker build . -t draggan:latest
docker run -p 7860: 7860 -v "$PWD":/workspace/src -it draggan:latest bash
cd src && python visualizer_drag_gradio.py --listen
```

Now you can open a shared link from Gradio (printed in the terminal console). Beware the Docker image takes about 25GB of disk space!

**Step 3:**

```bash
# download pre-trained weights
python scripts/download_model.py
```

If you want to try StyleGAN-Human and the Landscapes HQ (LHQ) dataset, please download weights from these links: [StyleGAN-Human](https://drive.google.com/file/d/1dlFEHbu-WzQWJl7nBBZYcTyo000H9hVm/view?usp=sharing), [LHQ](https://drive.google.com/file/d/16twEf0T9QINAEoMsWefoWiyhcTd-aiWc/view?usp=sharing), and put them under _./checkpoints_.

**Step 4:**

```bash
# start the DragGAN GUI
sh scripts/gui.sh
```

This GUI supports editing GAN-generated images. To edit a real image, you need to first perform GAN inversion using tools like [PTI](https://github.com/danielroich/PTI). Then load the new latest code and model weights to the GUI.

You can run DragGAN Gradio demo as well, this is universal for both windows and linux:

```bash
python visualizer_drag_gradio.py
```
