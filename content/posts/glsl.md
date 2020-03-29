---
title: "Intro to GLSL Shaders for Simulation Programming in Rust"
date: 2020-03-07T09:24:36-08:00
tag: rust
draft: true 
---
_Disclaimer: This is my first foray into GPU programming. If you see anything incorrect and feel so motivated, please [contact me](mailto:alex@alex-hansen.com) for correction._

A long term side project of mine is a gravitational and collisional particle physics simulator called [bigbang](https://github.com/sezna/bigbang). It was one of my first big programming projects in college around 2015-2016, and was written as an adaptation of one of my professor's ([Mark C. Lewis](https://www.cs.trinity.edu/~mlewis/)) projects. It was written shoddily, as one would expect. I rebooted the project later and shored it up, adding collision calculations, un-glitching the gravitational calculations, and released it on [crates.io](https://crates.io/crates/bigbang). As a step towards better performance, I'd like to incorporate GPU acceleration. I'm going to be using [emu](https://github.com/calebwin/emu) for its relatively simple API and low barrier of entry. A more fully-fledged resource for detailed graphics programming would be [wpgu-rs](https://github.com/gfx-rs/wgpu-rs/blob/master/examples/hello-compute/main.rs), but I will not be using that (yet).

___

> Shaders are written in the C-Like language GLSL.
> 
> - [LearnOpenGL](https://learnopengl.com/Getting-started/Shaders)


Emu provides a minimal wrapper over GLSL. I want to write what is known as a _compute shader_, or a shader used not for graphics but rather arbitrary value calculation. 
