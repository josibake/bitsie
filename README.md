# BITSIE (BITcoin SImulation Engine)

scripts and examples for running simulations against Bitcoin Core. this assumes you have already setup a hertzner account and setup the hertzner cli `hcloud`.

at a high level:

1. set up your server (`setup_server.sh`)
2. clone bitsie (`git clone https://github.com/josibake/bitsie.git`)
2. install dependencies (`install_dependencies.sh`)
3. create your baseline and feature worktrees (example below)
4. run simulations (`run_sims.sh`)

### Running a simulation

After running `setup_server.sh` and `install_dependencies.sh`, ssh into your server (`hcloud server ssh <server_name>`) and setup your baseline and feature directories:

```sh
# make a new branch off of the simulation branch for rebasing onto master
git checkout coin-sel-sim-trace && git checkout -b sim-baseline && git rebase master 

# resolve any merge conflicts and create the baseline worktree

git worktree add ../baseline

# repeat the same steps for your feature branch
git checkout coin-sel-sim-trace && git checkout -b sim-feature && git rebase josibake-coin-selection-rebase

git worktree add ../feature
```

Next, run simulations for your baseline. Provide a scenario and feerates from the simulation scenarios repo and run the simulation X times (you can use the helper script `run_sims.sh`):

```sh
/root/bitsie/run_sims.sh /root/baseline/ 5 /root/sim-results/ /root/coin-selection-simulation/payments/bustabit-tiny-hot-wallet.csv /root/coin-selection-simulation/feerates/2019-2020-per-day.csv
```
