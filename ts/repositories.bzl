load("@aspect_rules_js//npm:npm_import.bzl", _npm_translate_lock = "npm_translate_lock")

def flatbuffers_npm_repositories(name):
    _npm_translate_lock(
        name = name,
        npmrc = "@com_github_google_flatbuffers//:.npmrc",
        pnpm_lock = "@com_github_google_flatbuffers//:pnpm-lock.yaml",
        # Override the Bazel package where pnpm-lock.yaml is located and link
        # to the specified package instead.
        root_package = "ts",
        # Set this to True when the lock file needs to be updated, commit the
        # changes, then set to False again.
        update_pnpm_lock = False,
        verify_node_modules_ignored = "@com_github_google_flatbuffers//:.bazelignore",
        defs_bzl_filename = "npm_link_all_packages.bzl",
    )
