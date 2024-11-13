-- Fast as FUCK nvim completion. SQLite, concurrent scheduler, hundreds of hours of optimization.
return {
    "ms-jpq/coq_nvim",
    branch = "coq",
    lazy = true,
    dependencies = {
        {
            "ms-jpq/coq.artifacts",
            branch = "artifacts",
        },
        {
            "ms-jpq/coq.thirdparty",
            branch = "3p",
        },
    },
}
