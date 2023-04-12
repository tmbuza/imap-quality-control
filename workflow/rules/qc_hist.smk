rule plot_qc_histograms:
    input:
        "results/qc/seqkit1/seqkit_stats.txt",
        "results/qc/seqkit2/seqkit_stats.txt",
        "results/qc/seqkit3/seqkit_stats.txt",
    output:
        "images/qc_hist.png",
        "images/qc_hist.svg",
    script:
        "../scripts/plot_qc_hist.R"