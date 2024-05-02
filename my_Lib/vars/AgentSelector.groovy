package org.example

import jenkins.model.Jenkins
import org.jenkinsci.plugins.scriptsecurity.sandbox.whitelists.Whitelisted

class AgentSelector {
    @Whitelisted
    static String selectAgent() {
        def jenkins = Jenkins.instance
        def workerNode = jenkins.getNode("worker01")

        if (workerNode != null && workerNode.toComputer().online) {
            return 'worker01'
        } else {
            return 'any'
        }
    }
}
