destination = node[:dotfiles_destination]
repo_url    = node[:dotfiles_repo_url]

execute "git clone #{repo_url} ~/.dotfiles" do
  cwd '~/'
  not_if { File.exists?(File.expand_path(node[:dotfiles_url])) }
end

execute './install.sh' do
  cwd destination
end
