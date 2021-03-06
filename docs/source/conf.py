# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
# Import os sys and sphinx_rtd_theme

import os
import sys
import sphinx_rtd_theme
sys.path.insert(0, os.path.abspath('/home/michael/miniconda3/lib/python3.9/site-packages'))



# -- Project information -----------------------------------------------------

project = 'QTL_BSA_in_Python'
copyright = '2022, Michael Hall'
author = 'Michael Hall'

# The full version, including alpha/beta/rc tags
release = '1.0'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.autodoc',
                   'sphinx.ext.intersphinx',
                   'sphinx.ext.todo',
                   'sphinx.ext.coverage',
                   'sphinx.ext.mathjax',
                   'sphinx.ext.ifconfig',
                   'sphinx.ext.viewcode',
                   'sphinx.ext.githubpages']


# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']
source_suffix = '.rst'

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build','Thumbs.db','.DS_Store']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
pygments_style = 'sphinx'
master_doc = 'index'
#html_theme = 'alabaster'
html_theme = 'sphinx_rtd_theme'
html_add_permalinks = ""

html_theme_options = {
  'sticky_navigation': True,
  'collapse_navigation': False,
}
# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']


latex_engine = 'pdflatex'
latex_theme = 'howto'
latex_toplevel_sectioning = 'section'
