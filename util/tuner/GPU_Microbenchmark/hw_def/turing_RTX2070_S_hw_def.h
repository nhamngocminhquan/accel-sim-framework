// These are the configration parameters that can be found publicly sources
// https://www.techpowerup.com/gpu-specs/geforce-rtx-2070-super.c3440
// https://arxiv.org/pdf/1903.07486.pdf
// https://images.nvidia.com/aem-dam/en-zz/Solutions/design-visualization/technologies/turing-architecture/NVIDIA-Turing-Architecture-Whitepaper.pdf
// Turing HW def file
#ifndef TURING_RTX2070_S_DEF_H
#define TURING_RTX2070_S_DEF_H

#include "./common/common.h"
#include "./common/deviceQuery.h"

#define L1_SIZE (64 * 1024) // Max L1 size in bytes (per SM)

#define CLK_FREQUENCY 1605 // frequency in MHz (Base clock)

#define ISSUE_MODEL issue_model::single   // single issue core or dual issue
#define CORE_MODEL core_model::subcore    // subcore model or shared model
#define DRAM_MODEL dram_model::GDDR6      // memory type
#define WARP_SCHEDS_PER_SM 4              // number of warp schedulers per SM (Figure 4 and 41, Turing whitepaper)

// number of SASS HMMA per 16x16 PTX WMMA for FP16 - FP32 accumlate operation
// Unknown
#define SASS_hmma_per_PTX_wmma 4 

// These vars are almost constant between HW generation
// see slide 24 from Nvidia at
// https://developer.download.nvidia.com/video/gputechconf/gtc/2020/presentations/s21730-inside-the-nvidia-ampere-architecture.pdf
#define L2_BANKS_PER_MEM_CHANNEL 2
#define L2_BANK_WIDTH_in_BYTE 32

#endif
