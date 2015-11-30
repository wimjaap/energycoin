EnergyCoin integration/staging tree
==================================

Copyright (c) 2014-2015 EnergyCoin Developers

Change Log
---------

v1.4.0.0 (Latest Version):
- Reduce CPU consumption and reduce memory leaks, such as:
    CheckBlock optimizations
    Disable block validity check during initial startup (can restore with -checklevel=1)
    Skip stake modifier checksum and fStrictPayToScriptHash checks
    Skip scanning transactions earlier than the first key in wallet
    Avoid rescanning more than once for wallet start
    Reduce memory leaks for signing keys, processing scripts and orphans etc
    Clear memory used by random number generator
    Skip relay to peers before they send version message
    Skip peers older than one week
    Reduce socket leaks
    Skip reading sockets if draining write queue
    Skip preliminary checks if earlier than the last checkpoint timestamp
    Avoid multiblocks reorg transaction resurrection
    Avoid frequent bestblock updates to wallet
    Avoid frequent address dumps
    Avoid frequent balance check for every transaction
    Avoid staking before sync
    Avoid orphans by previous block check before staking
    GetHash caching and map hashed blocks for smoother staking
    Avoid staking for dusts or zero reward
    Remove console command if already in history
    Remove some unnecessary codes and debug messages
- Other performance tweaks, such as:
    Enable mfpmath, native arch and prefetch for g++
    Enable DB_LOG_AUTO_REMOVE
    Simplify CMutexLock
    Remove mapProofOfStake
    Optimistic TCP write queue control
- Update checkpoint
- BugFix: Make sure balance is shown even if no any bestblock record

v1.3.0.0:
- Add a new setstakesplitthreshold function on console (default 250). This can avoid fragmentation by setting a threshold for stake-splitting
- Update checkpoint and fix the "checkpoint too old" issue
- Fix an invalid conversion error when compiling on Windows
- Fix a multiple definition error when compiling on Linux

What is EnergyCoin (ENRG)?
------------------------

EnergyCoin is a pure PoS coin which generates coins through PoS blocks. Except the first block where it generates the initial 101 million coins, no PoW mining will get any coins. All every person has to do is post it on our facebook, twitter or reddit page, and add a signature to btctalk profile. Its easy and free!

After distribution is over energycoin is  mineable by simply running your wallet. Thus a huge mining cost of hardware and millions of electricity costs are saved.

EnergyCoin also adopts a variable PoS rate with the following annual interest rate:
Year-1: 10%
Year-2: 8%
Year-3: 6%
Year-4: 4%
Year-5: 2%
Year 6 has only 1% of annual interest.

-30 seconds block time to make sure network is stable and fast at the same time
-Difficulty retarget is based on each block ensures to keep the difficulty logical
-Scarce but not too scarce to be uninteresting or not usable. 101 million coins in distribution and interest values were decided to make sure the coin retains its value


Ports:
P2P:	22705
RPC:	22706

Support Development by Donation: ePvnQvX5RbzDCzt3qSB5TmBz89BJMvpG46

