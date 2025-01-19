# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GostoreAgent < Formula
  desc "Agent to expose ssh keys stored in gostore over ssh-agent"
  homepage "https://github.com/UsingCoding/gostore"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/UsingCoding/gostore-agent/releases/download/v0.0.1/gostore-agent_0.0.1_darwin_x86_64.tar.gz"
      sha256 "f397194706d17682718999d149fcfcb134ac769cce911261963103be807d541a"

      def install
        bin.install "gostore-agent"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/UsingCoding/gostore-agent/releases/download/v0.0.1/gostore-agent_0.0.1_darwin_arm64.tar.gz"
      sha256 "6f3e1ef7ef043b083becb001a4f04b0afef1826becc687ddfbe8c1ab849de59b"

      def install
        bin.install "gostore-agent"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/UsingCoding/gostore-agent/releases/download/v0.0.1/gostore-agent_0.0.1_linux_x86_64.tar.gz"
        sha256 "2ec740e7ec0ecd1115b73c0f1d9b321acd8c6b03e2da6978685989e9d0722ccd"

        def install
          bin.install "gostore-agent"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/UsingCoding/gostore-agent/releases/download/v0.0.1/gostore-agent_0.0.1_linux_arm64.tar.gz"
        sha256 "3306f8769ab849452407ff9d1f0314c62e871191937664a5a7c4868d49369048"

        def install
          bin.install "gostore-agent"
        end
      end
    end
  end

  def post_install
    (var/"run").mkpath
    system "#{bin}/gostore-agent", "install"
  end
end
