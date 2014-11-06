#
# Cookbook Name:: cuckoo sandbox
# Recipe:: install
# Author:: Mike Goodwin
#
# Copyright (C) 2014 Mike Goodwin
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# NB: This is under construction and does not work yet!
#

package 'libfuzzy-dev' # required for pyssdeep build
package 'python-pyrex' # required for pyssdeep installation  

# Checkout, build and  pyssdeep

execute 'checkout pyssdeep' do
  command 'svn checkout http://pyssdeep.googlecode.com/svn/trunk/ /tmp/pyssdeep'
end

execute 'build pyssdeep' do
  cwd '/tmp/pyssdeep'
  command 'python /tmp/pyssdeep/setup.py build'
  user 'root'
end

execute 'install pyssdeep' do
  cwd '/tmp/pyssdeep'
  command 'python /tmp/pyssdeep/setup.py install'
  user 'root'
end

log 'pyssdeep downloaded and installed'
